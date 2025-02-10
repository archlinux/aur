# Maintainer: Christian Heusel <christian (at) heusel (dot) eu>
# Contributor: jonathanh
# Contributor: dszryan
# Contributor: Bryce Beagle <first dot last at gmail dot com>
# Contributor: Giampaolo Mancini <mancho at trmpln dot com>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Dustin Falgout <dustin@falgout.us>
# Contributor: Gifts <gifts.antichat@gmail.com>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>

pkgname=rider-eap
pkgver=251.20015.32
pkgrel=1
_eapver=2025.1
_eaprelease=EAP3
# _eaprelease=RC1
epoch=1
pkgdesc="A cross-platform .NET IDE by JetBrains."
arch=('any')
options=('!strip')
url="https://www.jetbrains.com/rider/eap/"
license=("custom")
optdepends=('mono: .NET runtime' 'msbuild: build .NET Core projects')
source=("https://download-cdn.jetbrains.com/rider/JetBrains.Rider-${_eapver}-${_eaprelease}-${pkgver}.Checked.tar.gz"
        "${pkgname}.desktop")
sha256sums=('7dc90ba703bc493f066151c777fc312a3326fbc5e0a909c89e9100252180391c'
            'cbb7c9b847c92c95403be237ab01183eb0516b4a9b46c8ba27c87243fed8cbb8')

package() {
    # create the target folders
    install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/usr/bin/" "${pkgdir}/opt/"

    # install the package content
    cp -rdp --no-preserve=ownership "./JetBrains Rider-${pkgver}/" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "./${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    ln -s "/opt/${pkgname}/bin/rider.sh" "${pkgdir}/usr/bin/${pkgname}"
    ln -s "/opt/${pkgname}/license" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
