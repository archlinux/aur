# Maintainer: Danny Su <contact@dannysu.com>

pkgname=duplicati-latest
pkgver=2.0.0.94
pkgrel=1
pkgdesc='Free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers. Duplicati is open source software, written in mono and available for Windows, Linux, and Mac OS X.'
arch=('i686' 'x86_64')
url="http://www.duplicati.com/"
install=duplicati.install
license=('LGPL')
depends=('mono' 'gtk-sharp-2')
optdepends=()
source=("http://updates.duplicati.com/preview/duplicati-2.0.0.94_preview_2015-12-08.zip" duplicati_user.service)

sha1sums=('a393b19639ca56154584d61ad259c2087ff63a1e'
          'cf23e9cdc0f72d1b52288579f169c4476aa26a0f')

package() {
  rm "$srcdir/duplicati-2.0.0.94_preview_2015-12-08.zip"

  mkdir -p "$pkgdir/opt/duplicati-latest"
  cp -r . "$pkgdir/opt/duplicati-latest"

  # install systemd units
  install -Dm644 ../duplicati_user.service "${pkgdir}"/usr/lib/systemd/user/duplicati_latest.service
}
