# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot xyz>

_pkgname=zellij-selector
pkgname=$_pkgname-bin
_pkgver=2.4.1-2
pkgver=${_pkgver//-/.r}
pkgrel=1
pkgdesc="Select zellij session"
_arch=any
arch=($_arch)
license=(MPL2)
url=https://git.stefanwimmer128.eu/stefanwimmer128/zellij-selector
depends=('sh' 'libnewt' 'zellij' 'jq.sh')
optdepends=('fish: Option to option fish shell'
            'zsh: Option to open zsh shell'
            'bash: Option to open bash shell')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://codeberg.org/stefanwimmer128/zellij-selector-pkgbuild/releases/download/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('f8ef5e2b541c654f8b730659811cb3400f42db6109becaac2ca6236f5f6426d5')

build() {
  rm "$_pkgname-$_pkgver-$_arch.pkg.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
