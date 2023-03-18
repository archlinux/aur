# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='ttf-monda'
pkgver='2.0'
pkgrel='1'
description='Geometric sans serif font by Vernon Adams.'
arch=('any')
license=('custom:OFL')
_commit='01a4f5d96cb52ed3c08b9553cf896427ed041a37'
_dl_base_url="https://github.com/vernnobile/mondaFont/raw/${_commit}/version2.0"
source=("${_dl_base_url}/Roman/Monda-Bold.ttf"
        "${_dl_base_url}/Roman/Monda-Light.ttf"
        "${_dl_base_url}/Roman/Monda-Regular.ttf"
        "${_dl_base_url}/Roman/src/OFL.txt")
b2sums=('5d4146e86e01eb1378a4c11be00ee4c95a0f7f3dfba2322c9e8a6beeb4d6298f0331dcf51b77b628279de14ecbcbba71eb59e64c9a2d1020093b82827b371c10'
        '6cdc8db58641efa1c0f757c6eda7d806127095c4df78c821ad2a1868f9469b78f0dc940d9d37cdb05d1bcc1ba4d998a3962d5ef4f3f99c857a895a1662658574'
        'ec9f5f2b11f9e5c6540a493d606750b1282a7f040b31f1470b10be2069744a559cb67e828d0fd2bc6b0329d305af912d098a41c07463512577e6cce766173cd5'
        '8b3f2995a7f970f3e5ff14069263e40ba1df7a2f0e946c46d6a9ec387908af28e639e28eda21789f7dd84dbdc141f727b3a3d68c8159cced099fb6c12e25b474')

package () {
        install -m755 -d "${pkgdir}/usr/share/fonts/${pkgname}"
        install -m644 -t "${pkgdir}/usr/share/fonts/${pkgname}" "${srcdir}"/*.ttf
        install -Dm644 "${srcdir}/OFL.txt" \
                "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
}
