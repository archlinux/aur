# Maintainer: substanceof <vk-cli.dev[at]ya[dot]ru>
pkgname=vk-cli
pkgver=0.7.5
pkgrel=3
pkgdesc="A console (ncurses) client for vk.com written in D"
arch=('x86_64' 'i686')
url="https://github.com/vk-cli/vk"
license=('Apache')
depends=('curl' 'openssl' 'ncurses>=5.7')
makedepends=('dub' 'dmd>=2.071.0' 'git' 'dtools')
optdepends=('mpv: for music playback')
provides=("vk-cli")
conflicts=('hardening-wrapper' 'vk-cli-git')

source=("git+https://github.com/vk-cli/vk.git#tag=${pkgver}")
md5sums=('SKIP')

_gitname=vk

build() {
  cd "$srcdir/$_gitname"
  dub build --config=release-shared
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 -t "$pkgdir/usr/bin" 'vk'
}

