# Maintainer: TheCyberArcher <TheCyberArcher@protonmail.ch>
# Contributor: novenary
# Contributor: Daniel M. Capella
# Contributor: Dan Elkouby

pkgname=socos
pkgver=r215.7719b54
pkgrel=1
pkgdesc="Commandline tool for controlling Sonos devices"
arch=('any')
url="https://github.com/SoCo/socos"
license=('MIT')
depends=('python' 'python-setuptools' 'python-soco')
makedepends=('git')
options=(!emptydirs)
source=("git+https://github.com/SoCo/socos.git" "LICENSE")
sha256sums=('SKIP' 'd1767cf8f8caf414fa00c6e09f121c2a848570fe9261c735597647f20aa3b0d6')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/socos"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 $srcdir/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et: