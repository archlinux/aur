# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 <Nicky726 [at] gmail [dot] com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=setools3-libs
_pkgname=setools
pkgver=3.3.8
pkgrel=1
pkgdesc="Policy analysis tools for SELinux - libraries of setools3 for policycoreutils<2.6"
groups=('selinux')
arch=('i686' 'x86_64')
url="https://github.com/TresysTechnology/setools3/wiki"
license=('GPL' 'LGPL')
depends=('flex' 'bison' 'libselinux>=2.4' 'libsepol>=2.4' 'libsepol<2.7' 'sqlite3>=3.6.20' 'python2')
optdepends=('glib2: needed for graphical tools'
            'gtk2>=2.8: needed for graphical tools'
            'bwidget>=1.8: needed for graphical tools'
            'libglade>=2.6.4: needed for graphical tools'
            'tk>=8.4.9: needed for graphical tools')
makedepends=('java-environment' 'bwidget>=1.8' 'gtk2>=2.8' 'glib2'
             'libglade>=2.6.4' 'swig' 'tk>=8.4.9')
conflicts=("setools<4.0.0")
# Use patchs from git tree to be able to grab 0012-Make-the-SWIG-files-compatible-with-SWIG-3.patch
# and 0013-Update-for-2015-02-02-Userspace-release-2.4.patch without conflicts,
# which are needed to make setools build successfully.
# And as AUR4 forbids big patches (>100 KB), use ugly filenames from GitHub.
source=("https://raw.githubusercontent.com/wiki/TresysTechnology/setools3/files/dists/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
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
            '72938e8a16dcd783572285dbccf3173311bc6f59cbd97cbd0363e7665eec8097'
            '95ace99f56a2ca813489dbd7a2081393b7cadc398821ad9f542e3642fcc47fae'
            'ef68806449433b27e62dba6e9b981566e2a7e56ef448d25bbf0c7528214eb08e'
            '28543976b4c0a43d7f17bfe74820249701cc829a7a4ae89f60ba7d186895ea6e'
            'a2b9a0d030710b29a6ec06d1c1de2d48483befa381964345f73744b6ef0e95cd'
            '37816252049263a2f7c159d583f816f13f17eb7c5696a1bc9af6dc91f3567c50'
            'd4843ed9e6cc3d8c76091de9d18e4ad72d079ab89a3c829a735e0899501656d4'
            '6d2a8366c2d8691567a9e7b668d365b740bc55b87357ae0e857367d7fc2787f6'
            '08f3d790f157517d15de17ea9c06eec27f190939eb3214313ee50901a2cdade3'
            '2a28fb41c98970bdb587bb49ce3af38b95c83207233e7b05fb4e704992d20613'
            'f121085fc16fdec2defb4fb0487aa38623874de49ba531ea3a2a00768a9b2ed4'
            '46e1255406ab7ed640b9ee9d82bd355c80ea6a69309d430e4b43b989db3f9803'
            '354e005e9af44a5f12433c51cee55890db6420501336743e90e224a4660659ab')

prepare() {
  cd "${_pkgname}-${pkgver}"
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
  cd "${_pkgname}-${pkgver}"

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

  make libqpol
  make libapol
}

package() {
  cd ${_pkgname}-${pkgver}
  make -C libapol DESTDIR="${pkgdir}" install
  make -C libqpol DESTDIR="${pkgdir}" install

  # Remove files which conflict with setools4
  rm -f "${pkgdir}/usr/lib/python2.7/site-packages/setools/__init__.py"
  rm -f "${pkgdir}/usr/lib/python2.7/site-packages/setools/__init__.pyc"
  rm -f "${pkgdir}/usr/lib/python2.7/site-packages/setools/__init__.pyo"
}
