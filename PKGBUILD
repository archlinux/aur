# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=linux-smart-enumeration-git
_name="${pkgname%-git}"

pkgver() { git -C "$_name" describe --tags --long | sed 's/-/.r/;s/-/./g'; }
pkgver=3.2.r0.gc338749
pkgrel=1

pkgdesc='Linux enumeration tool for pentesting and CTFs with verbostiy levels'
arch=('any')
url="https://github.com/diego-treitos/$_name"
license=('GPL3')

provides=("$_name")
conflicts=("$_name")

makedepends=('git')
depends=('bash')

source=("git+$url.git")
sha256sums=('SKIP')


package() {
  cd "$_name"
  install -Dm755 lse.sh            "$pkgdir/usr/bin/lse"
  install -Dm644 doc/* README.md -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 screenshots/*   -t"$pkgdir/usr/share/doc/$_name/screenshots/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
