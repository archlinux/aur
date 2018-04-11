# Creator: Paulo Alexandre Aquino da Costa <contact at pauloalexandre dot com>

# Maintainer: Paulo Alexandre Aquino da Costa <contact at pauloalexandre dot com>
pkgname='psync'
pkgver='0.1.4'
pkgrel=1
pkgdesc='A naive tool for syncing partitions using rsync'
arch=('any')
url="https://github.com/paulequilibrio/${pkgname}"
license=('AGPL3')
depends=('python-docopt' 'python-yaml' 'rsync' 'beep')
makedepends=('git')
install="${pkgname}.install"
source=("git+https://github.com/paulequilibrio/${pkgname}")
sha256sums=('SKIP')

package() {
  install -dm 755 "$pkgdir"/{etc,usr/{bin,share/man/man8,lib/$pkgname/source}}
  cd "$pkgname"
  install -Dm 644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 'examples/simple_config.yaml' "$pkgdir/etc/$pkgname/simple_config.yaml"
  install -Dm 755 "documentation/${pkgname}.8" "$pkgdir/usr/share/man/man8/${pkgname}.8"
  install -Dm 755 "$pkgname" "$pkgdir/usr/lib/$pkgname/$pkgname"
  cd source
  install -Dm 644 "__init__.py" "$pkgdir/usr/lib/${pkgname}/source/__init__.py"
  install -Dm 644 "helpers.py" "$pkgdir/usr/lib/${pkgname}/source/helpers.py"
  install -Dm 644 "bash.py" "$pkgdir/usr/lib/${pkgname}/source/bash.py"
  install -Dm 755 "${pkgname}.py" "$pkgdir/usr/lib/${pkgname}/source/${pkgname}.py"
  ln -s "/usr/lib/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
