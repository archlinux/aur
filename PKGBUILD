# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Rojikku <RojikkuNoKami at gmail dot com>
pkgname=remoteplaywhatever-bin
pkgver=0.2.3alpha
pkgrel=1
pkgdesc="Tiny application that lets you force remote play together any game you have in your steam library including non-steam ones."
arch=('x86_64')
license=('MIT')
url="https://github.com/m4dEngi/RemotePlayWhatever"
provides=()
conflicts=("${pkgname%-bin}")
depends=('gcc-libs' 'glibc')
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver%alpha}-alpha/RemotePlayWhatever-${pkgver%alpha}-Linux.deb"
  "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('06de4747350c6c2c98457f2d65929242cccc652bfccf5d7240a8c617cbb7b400'
            '284724acc9bb9b5a0579ca01589605ad6d8b4cd01094d7077ca6308aa5786cdd')
package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}