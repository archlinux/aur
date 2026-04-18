# Maintainer: Evans Jahja <evansjahja13 gmail>
pkgname=roc-alpha4-rolling-bin
pkgver=2025.09.09.d73ea10
pkgrel=2
epoch=0
pkgdesc="A fast, friendly, functional language."
arch=('x86_64' 'aarch64')
url="https://www.roc-lang.org/"
license=('UPL')
groups=()
depends=('glibc')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_pkgpath="$pkgname-$epoch"
source_x86_64=($_pkgpath$SRCEXT::"https://github.com/roc-lang/roc/releases/download/alpha4-rolling/roc-linux_x86_64-alpha4-rolling.tar.gz")
source_aarch64=($_pkgpath$SRCEXT::"https://github.com/roc-lang/roc/releases/download/alpha4-rolling/roc-linux_arm64-alpha4-rolling.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

_folder=$(bsdtar -tf $_pkgpath$SRCEXT | head -n 1)

pkgver() {
  basename $_folder | awk 'BEGIN{FS="-";OFS="."} {print $3,$4,$5,$6}'
}

package() {
        local _usr_bin="$pkgdir/usr/bin"
        mkdir -p $_usr_bin
        cd $_folder
        cp roc roc_language_server $_usr_bin
}
