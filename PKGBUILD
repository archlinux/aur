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
pkgver=251.23774.118
pkgrel=1
_eapver=2025.1
_eaprelease=EAP8
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
sha256sums=('4d86de570108561e4e94afb9ae351377bfe48dd390457d7698b594be36cec41e'
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
