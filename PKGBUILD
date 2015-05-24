# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 <Nicky726 [at] gmail [dot] com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=setools
pkgver=3.3.8
pkgrel=5
pkgdesc="Policy analysis tools for SELinux"
groups=('selinux')
arch=('i686' 'x86_64')
url="https://github.com/TresysTechnology/setools3/wiki"
license=('GPL' 'LGPL')
depends=('flex' 'bison' 'libselinux>=2.4' 'libsepol>=2.4' 'sqlite3>=3.6.20' 'python2')
optdepends=('glib2: needed for graphical tools'
            'gtk2>=2.8: needed for graphical tools'
            'bwidget>=1.8: needed for graphical tools'
            'libglade>=2.6.4: needed for graphical tools'
            'tk>=8.4.9: needed for graphical tools')
makedepends=('java-environment' 'bwidget>=1.8' 'gtk2>=2.8' 'glib2'
             'libglade>=2.6.4' 'tk>=8.4.9')
conflicts=("selinux-${pkgname}")
provides=("selinux-${pkgname}=${pkgver}-${pkgrel}")
# Use patchs from git tree to be able to grab 0012-Make-the-SWIG-files-compatible-with-SWIG-3.patch
# and 0013-Update-for-2015-02-02-Userspace-release-2.4.patch without conflicts,
# which are needed to make setools build successfully.
# And as AUR4 forbids big patches (>100 KB), use ugly filenames from GitHub.
source=("https://raw.githubusercontent.com/wiki/TresysTechnology/setools3/files/dists/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "https://github.com/TresysTechnology/setools3/commit/4560a00c872d0a664c1098585e5c1a209adf698b.patch"
        "https://github.com/TresysTechnology/setools3/commit/76e333503433be018e8aee8992d8f77aa14979a5.patch"
        "https://github.com/TresysTechnology/setools3/commit/ebf8c55a26abd7d5e088f9299a4d5c0df329446b.patch"
        "https://github.com/TresysTechnology/setools3/commit/a85750fa6ed6570e29a52520317ec0986612eab9.patch"
        "https://github.com/TresysTechnology/setools3/commit/0aa68c97dfd909d84242f3aca96923676770bf33.patch"
        "https://github.com/TresysTechnology/setools3/commit/eefba53065bd522f3e053605d0c3a1d52a4aefbb.patch"
        "https://github.com/TresysTechnology/setools3/commit/02bb44767963b38c0cd8f07c4ad55c23c67ebe9b.patch"
        "https://github.com/TresysTechnology/setools3/commit/92fa9a361aa962e21701cc601c175ab5c6798583.patch"
        "https://github.com/TresysTechnology/setools3/commit/f31571fd633c5ab6c76f6da4af2f0a0a2dc98f4e.patch"
        "https://github.com/TresysTechnology/setools3/commit/6f3dd212e9b5d466628bb5be4263416057728219.patch"
        "https://github.com/TresysTechnology/setools3/commit/8001568ca3914432ffc3825acb278a1e6d8293d9.patch"
        "https://github.com/TresysTechnology/setools3/commit/4668d85ef6b078de110caf3aa6cdf89a7d8aa89d.patch"
        "https://github.com/TresysTechnology/setools3/commit/f1e5b208d507171968ca4d2eeefd7980f1004a3c.patch")
sha256sums=('44387ecc9a231ec536a937783440cd8960a72c51f14bffc1604b7525e341e999'
            '14144c9d4bb3e1ea040f049a7fb0da0660df061a68a00ca9c66dcbbe8c334097'
            '10b02d8074cf823bd6eefa7650ab385ea084ef1e4a88c201930a673e813c52d1'
            '8951699c1976cba9f8a9fe32dc8c80a072d747155e3b731fb5f6072e12a92c53'
            'e2745ec4cb7bc8efdc47abc16b049db5144939123b8e19e0395b5d21c5f49fa8'
            '52e0e0eb6b41d7dedf5582dbf9f889594d6ef06ef24a85e3ecb6b93958838832'
            '2d081631219c07cf573e3c3b912ceafbf894d043db75db77b893b50252fabb82'
            '901b67411efa25e578b660aba0a171da0eb6b0ece824300eb30f80d992e582e6'
            '7d2a001ecceef59b77d93522bef8a69f34e7e0294ed1605daf0585ffc55c3ba7'
            'cd1552026f40a92bb57c20bf28ce9d11865b137c047e9993fb2bdbb209ae9d07'
            '01efb617890d9173883a94a5a416fb20621e2fe26db6a52dca139b4fc884556f'
            '9a302906aad975f4d1460ec0e0316b24d035c574796655c56ddf252459eaeb30'
            '948a69c4f0b3389d985be9e460cf89efc86c1cd1ba735f655d81a1036e14d956'
            '02bb2496f1c33177099ee025be3c297eec718dfe41565695e21056e165d4d626')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../4560a00c872d0a664c1098585e5c1a209adf698b.patch
  patch -Np1 -i ../76e333503433be018e8aee8992d8f77aa14979a5.patch
  patch -Np1 -i ../ebf8c55a26abd7d5e088f9299a4d5c0df329446b.patch
  patch -Np1 -i ../a85750fa6ed6570e29a52520317ec0986612eab9.patch
  patch -Np1 -i ../0aa68c97dfd909d84242f3aca96923676770bf33.patch
  patch -Np1 -i ../eefba53065bd522f3e053605d0c3a1d52a4aefbb.patch
  patch -Np1 -i ../02bb44767963b38c0cd8f07c4ad55c23c67ebe9b.patch
  patch -Np1 -i ../92fa9a361aa962e21701cc601c175ab5c6798583.patch
  patch -Np1 -i ../f31571fd633c5ab6c76f6da4af2f0a0a2dc98f4e.patch
  patch -Np1 -i ../6f3dd212e9b5d466628bb5be4263416057728219.patch
  patch -Np1 -i ../8001568ca3914432ffc3825acb278a1e6d8293d9.patch
  patch -Np1 -i ../4668d85ef6b078de110caf3aa6cdf89a7d8aa89d.patch
  patch -Np1 -i ../f1e5b208d507171968ca4d2eeefd7980f1004a3c.patch

  # Disable broken check for SWIG version, to allow using swig 3
  sed -e "s/AC_PROG_SWIG(2.0.0)/AC_PROG_SWIG/" -i configure.ac
}

build() {
  cd "${pkgname}-${pkgver}"

  export PYTHON=/usr/bin/python2

  aclocal
  autoreconf -if
  automake

  # Arch uses rather nonstandard directory for policy sources
  ./configure \
    --enable-swig-python \
    --enable-swig-tcl \
    --with-default-policy=/etc/selinux/refpolicy/src/policy \
    --disable-bwidget-check \
    --disable-selinux-check \
    --prefix=/usr \
    --sbindir=/usr/bin
  # work around issue with gcc 4.3 + gnu99 + swig-generated code:
  sed -i -e 's:$(CC):gcc -std=gnu89:' libseaudit/swig/python/Makefile

  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
