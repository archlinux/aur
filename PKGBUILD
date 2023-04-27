# Maintainer: ZappaBoy <federico.zappone at justanother dot cloud>
pkgname=worky
pkgbase=worky
pkgver=0.1.7
pkgrel=1
pkgdesc="Worky is a tool that helps to define and load project workspaces."
arch=('any')
url="https://github.com/ZappaBoy/worky"
license=('GPL3')
depends=('python')
makedepends=('git')
provides=(worky)
source=('git+https://github.com/ZappaBoy/worky')
md5sums=('SKIP')

prepare() {
  mkdir -p ~/.config/worky
}

instructions() {
  /bin/cat << EOF
The default ~/.config/worky folder was created. Put your config.toml here.
EOF
}

package() {
  cd "$srcdir/worky/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  # This is not the best way to do that. Probably the best way is to get the package from PyPI. This is a future work.
  pip install "worky==$pkgver"
  instructions
}

# vim:set ts=2 sw=2 et:
