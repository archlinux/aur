# Maintainer: Whyme Lyu <callme5long@gmail.com>

pkgname=neovim-man
pkgver=1
pkgrel=2
pkgdesc="View manpages with Neovim by default"
arch=('any')
depends=(neovim sh)
source=(nvim-man nvim-man.desktop env.conf)
b2sums=(SKIP SKIP SKIP)

package() {
  pushd "$srcdir"

  install -Dm755 nvim-man "$pkgdir"/usr/bin/nvim-man

  desktop_dir="$pkgdir"/usr/share/applications/
  install -dm755 "$desktop_dir"
  install -Dm644 nvim-man.desktop "$desktop_dir"

  envd_dir="$pkgdir"/usr/lib/environment.d/
  install -dm755 "$envd_dir"
  install -Dm644 env.conf "$envd_dir"/10-nvim-man.conf

  popd
}
