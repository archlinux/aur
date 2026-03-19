pkgname='prman-bin'
pkgver='1.0.2'
pkgrel=1
pkgdesc='Terminal-first project repository manager. (prebuilt binary release)'
arch=('x86_64')
url='https://github.com/bencetotht/prm'
license=('MIT' 'Apache-2.0')
depends=('git')
optdepends=(
  'lazygit: open lazygit with the g shortcut'
  'tmux: popup and terminal-window integrations'
)
provides=('prman')
conflicts=('prman' 'prm')
source=("prman-bin-1.0.2-x86_64.tar.gz::https://github.com/bencetotht/prm/releases/download/v1.0.2/prm-v1.0.2-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a7fed38e11a0936f76e7cef5253c2bc0494ed397a0289e3e242f17e110ea95a2')

package() {
  cd "prm-1.0.2-x86_64-unknown-linux-gnu"
  install -Dm755 "prm" "${pkgdir}/usr/bin/prm"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/prman-bin/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/prman-bin/LICENSE-APACHE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/prman-bin/README.md"
}
