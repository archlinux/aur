# Maintainer: TwoTXH <twotxh at gmail dot com>
pkgbase=poryscript-git
pkgname=poryscript
pkgver=2.1.0
pkgrel=1
pkgdesc="High-level scripting language for gen 3 pokemon decompilation projects"  
arch=("any")
url="https://www.huderlem.com/poryscript-playground/"
license=('MIT')
makedepends=("go")
source=("git+https://github.com/huderlem/poryscript")
noextract=()
md5sums=("SKIP") #autofill using updpkgsums

build() {
  cd "$pkgname"
  go build
}

package() {
  cd "$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}
