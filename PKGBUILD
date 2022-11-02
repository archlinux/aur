# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=ectpping
pkgver=0.2
pkgrel=2
pkgdesc="'ping' type utilty for the Ethernet V2.0 Configuration Testing Protocol"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/ectpping.berlios/"
license=('GPL2')
#source=("git+https://github.com/markzzzsmith/ectpping")
source=("https://downloads.sourceforge.net/project/ectpping.berlios/ectpping-0.2.tar.gz"
        "linux-5.2-siocgstamp.diff")
sha256sums=('ac3fb1f528b6c947f0a73fa397246438900b96855acf19c0bb854bce4154dcd3'
            '7d534fd4a3f06fcfb77d90ba7d9e27e1d8188cf22f71efd80d178b1ec44a9de8')

prepare() {
  cd "$pkgname"
  patch -Np1 < "$srcdir/linux-5.2-siocgstamp.diff"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm 755 "ectpping" "$pkgdir/usr/bin/ectpping"
}

# vim:set ts=2 sw=2 et:
