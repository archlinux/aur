# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')


pkgname=rsatool-git
_name="${pkgname%-git}"

pkgver() { git -C "$_name" log -n1 --format=%cs.g%h | tr - .; }
pkgver=2021.04.17.g2bd92b3
pkgrel=1

pkgdesc='Calculate RSA and RSA-CRT parameters'
arch=('any')
url="https://github.com/ius/$_name"
license=('BSD')

provides=("$_name")
conflicts=("$_name")

makedepends=('git')
depends=('python' 'python-gmpy2' 'python-pyasn1')

source=("git+$url.git")
sha256sums=('SKIP')


package() {
  cd "$_name"
  install -Dm755 "$_name.py" "$pkgdir/usr/bin/$_name"
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 LICENSE   -t"$pkgdir/usr/share/licenses/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
