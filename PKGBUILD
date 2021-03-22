# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='ocdownloader'
_upstreamver='1.7.11'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='github-releases'
_repo='e-alfred/ocdownloader'


pkgdesc='Easy to use download manager using Curl/Aria2 and youtube-dl for Nextcloud'
pkgname=('nextcloud-app-ocdownloader')
pkgver="${_upstreamver}"
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://github.com/${_repo}"
makedepends=()
depends=('nextcloud')
optdepends=(
	'aria2: To use aria2 as download manager'
	'curl: To download files using curl'
	'youtube-dl: To download videos')
options=('!strip')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_nextcloud_appname}-${pkgver}.tar.gz")
sha512sums=('77924bdd0306566093a7dd9b840ec3e0fcc96aa9533aa4ed23c5f48c33c2d8765c877b009ab566293129320d9b7291b5e318e21ad37e9d8e001b7016c237186f')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}
