# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Previous Maintainer: ghost64 <michael at corrigan dot xyz>
# Previous Maintainer: uzerus <szymonscholz at gmail dot com>
# Previous Maintainer: Matthew Gamble

pkgname='duck'
pkgver='8.7.1.40770'
pkgrel='1'
pkgdesc='Cyberduck CLI file transfer client for WebDAV HTTPS FTP-SSL SFTP Azure Backblaze B2 Google Cloud Drive Amazon S3 OpenStack Swift Rackspace DRACOON Dropbox OneDrive SharePoint'
arch=('x86_64')
license=('GPL')
options=('!strip')
# https://dist.duck.sh/
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
md5sums=('97369ce042d9d59c5f0678c8995ad25f')
sha256sums=('de5055fd90e23de58b98a8a4ffb227cbf36568cba43657d831d57ab5b39a7f99')

package() {
  cp -pR 'opt' "${pkgdir}/opt"
  chmod -R 'go-w' "${pkgdir}/opt/duck"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s '/opt/duck/bin/duck' "${pkgdir}/usr/bin/duck"
  # GUI not available for Linux. CLI only.
  #install -Dm644 "${pkgdir}/opt/duck/lib/duck-duck.desktop" "${pkgdir}/usr/share/applications/duck.desktop"
}
