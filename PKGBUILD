# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: ghost64 <michael at corrigan dot xyz>
# Contributor: uzerus <szymonscholz at gmail dot com>
# Contributor: Matthew Gamble

pkgname='duck'
pkgver='9.1.3.42945'
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
md5sums=('6ddf033eec1d9440588a935c1ad29a9c')
sha256sums=('c3dbb6e9b95c0a64c84e0399bcaca2e32172df052132da63a5a2f5b4f527c8ed')

package() {
  cp -pR 'opt' "${pkgdir}/opt"
  chmod -R 'go-w' "${pkgdir}/opt/duck"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s '/opt/duck/bin/duck' "${pkgdir}/usr/bin/duck"
  # GUI not available for Linux. CLI only.
  #install -Dm644 "${pkgdir}/opt/duck/lib/duck-duck.desktop" "${pkgdir}/usr/share/applications/duck.desktop"
}
