# Maintainer: Kodecable <Kodecable@outlook.com>
# Contributor: BryanLiang <liangrui.ch@gmail.com>

pkgname=ariang-allinone-bin
_pkgname=ariang-allinone
pkgver=1.3.12
pkgrel=1
pkgdesc="A modern web frontend making aria2 easier to use. (Use precompiled all-in-one version)"
arch=('any')
url="https://github.com/mayswind/AriaNg"
license=('MIT')
depends=('xdg-utils')
makedepends=('unzip')
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.zip::https://github.com/mayswind/AriaNg/releases/download/${pkgver}/AriaNg-${pkgver}-AllInOne.zip"
        "${_pkgname}.desktop"
        "${_pkgname}.sh"
        "favicon.png::https://raw.githubusercontent.com/mayswind/AriaNg/master/src/favicon.png"
        "tileicon.png::https://raw.githubusercontent.com/mayswind/AriaNg/master/src/tileicon.png"
        "touchicon.png::https://raw.githubusercontent.com/mayswind/AriaNg/master/src/touchicon.png")

noextract=("${_pkgname}-${pkgver}.zip")

b2sums=('8b35fc04c8924a4b4fd9346910d9d30e16415479876c3dae16cab37e2a1315e314797d9b49353d101bd6ade446774d8a3beeb40aa3b4f8b7821ce69db34f6747'
        '75f9cd947d78ff94a20104cc2d138d82fdb47d8ba994292b27bf88f5e9a5204e989af39a738821bd4dfb500b63e45103cf70ddddc7523e3175b53652241c4701'
        'bfb87b310a76ee826edfcc8b04bc77e2c006681fd842bce7013e929cf5efd1ccaa4622aeace1bc1677633a185567732d3ea4a1ea5f9fea78e0bd1d9702f64be7'
        '627ad0d8dc89015801d7afb278e1ce80f148a8c4635292fb0a7402c7f33d13ee78060f5e5994e2629e7d0af87d8979784aab13ef906f0a2135213623bc74d2b0'
        '060488c2c08aaca3937561249aaea198540f1034f946d98de4a667b44bc00c62ed777d8bd6e9d154e5d5551eeabbc9b06cc37b6233296a15268f29002252f572'
        'e89df0504e8252bcd96866b04ab12a9783f419089357d0cc67022884c515e29423502aa299e8bf522b88a18bbf5caadd4ea0d0014820a355da5ecca23e365c3a')

prepare() {
    unzip -o "${_pkgname}-${pkgver}.zip"
}

package() {
    cd "${srcdir}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
    install -Dm 644 index.html -t "${pkgdir}/usr/share/${_pkgname}/"
    install -Dm 644 favicon.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
    install -Dm 644 touchicon.png "${pkgdir}/usr/share/icons/hicolor/114x114/apps/${_pkgname}.png"
    install -Dm 644 tileicon.png "${pkgdir}/usr/share/icons/hicolor/144x144/apps/${_pkgname}.png"
    install -Dm 644 "${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm 755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
