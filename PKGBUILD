# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Alberto Redondo <albertomost at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Piotr Górski <lucjan.lucjanov@gmail.com>
pkgname=papirus-folders
pkgver=1.13.1
pkgrel=1
pkgdesc="Allows changing the color of folders in Papirus icon theme and its forks"
arch=('any')
url="https://github.com/PapirusDevelopmentTeam/papirus-folders"
license=('MIT')
depends=('bash' 'papirus-icon-theme')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.hook")
sha256sums=('df38d1a86d4aaad575d1f93f1fc541d538409d985fa418d5eac46a77c18cb028'
            'b6f52cab4c7a42e85b7e3cc0160bb9cf060aed20ab78ee2135a3f18dcaf6e92c')

package() {
  cd "$pkgname-$pkgver"
  make ZSHCOMPDIR="/usr/share/zsh/site-functions" DESTDIR="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/$pkgname.hook" -t "$pkgdir/usr/share/libalpm/hooks"
}
