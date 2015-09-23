# Maintainer: Henrik Hodne <henrik@hodne.io>

pkgname=slack-desktop-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Slack Desktop"
url="https://slack.com/apps"
arch=('x86_64' 'i686')
depends=('gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'libxss' 'desktop-file-utils' 'alsa-lib' 'gvfs' 'xdg-utils' 'hunspell-en')
optdepends=('libgnome-keyring')
source_x86_64=(https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-amd64.deb)
source_i686=(https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-${pkgver}-i386.deb)
sha256sums_x86_64=('f30305787596aea7db7f6785afaeae19930eaf4b97dbb9cc057b83ede157807d')
sha256sums_i686=('a11c94edd7ee5e7ae1be642de26cdea7336acfb0a313b2a7cdf9a32317c55d9e')
install="${pkgname}.install"

package() {
    cd "${srcdir}"

    tar -xf data.tar.xz -C "${pkgdir}"

    # Disable automatic updates by removing cron entry
    rm -rf "${pkgdir}/etc"
}
