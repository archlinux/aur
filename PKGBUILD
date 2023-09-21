# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Previous Maintainer: ghost64 <michael at corrigan dot xyz>
# Previous Maintainer: uzerus <szymonscholz at gmail dot com>
# Previous Maintainer: Matthew Gamble

pkgname='duck'
pkgver='8.6.3.40040'
pkgrel='1'
pkgdesc='Cyberduck CLI file transfer client for WebDAV HTTPS FTP-SSL SFTP Azure Backblaze B2 Google Cloud Drive Amazon S3 OpenStack Swift Rackspace DRACOON Dropbox OneDrive SharePoint'
arch=('x86_64')
license=('GPL')
options=('!strip')
url='https://duck.sh/'
depends=(
  'java-runtime'
#  'java-environment-common'
  'pango'
  'libxi'
  'libnet'
  'libglvnd'
  'gdk-pixbuf2'
)
source=("https://dist.duck.sh/${pkgname}-${pkgver}-1.${CARCH}.rpm")
#source=("https://repo.cyberduck.io/stable/x86_64/$pkgname-$pkgver-1.$CARCH.rpm")
md5sums=('73f945033d05edc5c4d6e99c7f6524db')
sha256sums=('f12afad669ba7e14dedb6af42fbcf76ba7cb3ebc5d1412474155b96a7b7a87d1')

package() {
  cp -pR 'opt' "${pkgdir}/opt"
  chmod -R 'go-w' "${pkgdir}/opt/duck"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s '/opt/duck/bin/duck' "${pkgdir}/usr/bin/duck"
  # GUI not available for Linux. CLI only.
  #install -Dm644 "${pkgdir}/opt/duck/lib/duck-duck.desktop" "${pkgdir}/usr/share/applications/duck.desktop"
}
