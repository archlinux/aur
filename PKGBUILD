# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

_pkgname=zellij-selector
pkgname=$_pkgname-bin
_pkgver=2.3.2-1
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
source=("https://git.stefanwimmer128.io/api/v4/projects/135/packages/generic/$_pkgname/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('bcc1825fe6305c34ec805026754f7bb9d1402f9062a42d80a5b2ba62fbe5dca6')

build() {
  rm "$_pkgname-$_pkgver-$_arch.pkg.tar.zst"
  rm .BUILDINFO .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
