# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Alberto Redondo <albertomost at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Piotr Górski <lucjan.lucjanov@gmail.com>
pkgname=papirus-folders
pkgver=1.14.0
pkgrel=1
pkgdesc="Allows changing the color of folders in Papirus icon theme and its forks"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-folders"
license=('MIT')
depends=(
  'bash'
  'papirus-icon-theme'
)
makedepends=('git')
source=("git+https://github.com/PapirusDevelopmentTeam/papirus-folders.git#tag=v$pkgver?signed"
        "$pkgname.hook")
sha256sums=('a1632b752e1b65814a7c316e6b6a94833b72fe88c912cfe58b5293a899102055'
            'b6f52cab4c7a42e85b7e3cc0160bb9cf060aed20ab78ee2135a3f18dcaf6e92c')
validpgpkeys=('1BA35B1B2207A266F6E0AD2AF0EC91A29D2E78EC') # Sergei Eremenko <finalitik@gmail.com>

package() {
  cd "$pkgname"
  make ZSHCOMPDIR="/usr/share/zsh/site-functions" DESTDIR="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$pkgname.hook" -t "$pkgdir/usr/share/libalpm/hooks/"
}
