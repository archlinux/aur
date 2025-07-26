# Maintainer: Tom Brown <tom@CarlsonSpeed.com>
# Contributor: ChatGPT by OpenAI (https://openai.com/)
pkgname='bashdev'
pkgver=0.2.0
pkgrel=1
pkgdesc="A library of reusable Bash functions for script developers."
arch=('any')
url="https://github.com/TomB19/$pkgname"
license=('MIT')
depends=('bash' 'github-cli')
makedepends=('git')
source=("git+https://github.com/TomB16/$pkgname.git#branch=master")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname" || return 1

  # Install scripts
  for f in src/*; do
    install -Dm755 "$f" "$pkgdir/usr/bin/$(basename "$f")"
  done

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
