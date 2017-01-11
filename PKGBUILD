# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='ttf-cutive-mono'
pkgver='1.001'
pkgrel='2'
description='Monospaced font based on the IBM Executive typewriters.'
arch=('any')
license=('custom:OFL')
_dl_base_url='https://github.com/vernnobile/CutiveFont/raw/master/CutiveMono/GWF-1.001'
source=("${_dl_base_url}/CutiveMono-Regular.ttf"
        "${_dl_base_url}/OFL.txt")
sha512sums=('baf0acc7ebf13087244c286445d85db0ddb57ef24685c6696e2e9cbd637493c4f50e4b2ffe44ce85190daea5533ae00a714fce716d664209b46168946bd1f491'
            'ba9ad59388c5a862aef48d976ee7a72839b10ad9da5b74d0ca98adad7b81cabd6207e407ce914f9845fd60e272ce878f7d4b5d5d635378de5806e412fe2f2515')

package () {
        install -m755 -d "${pkgdir}/usr/share/fonts/${pkgname}"
        install -m644 -t "${pkgdir}/usr/share/fonts/${pkgname}" "${srcdir}"/*.ttf
        install -Dm644 "${srcdir}/OFL.txt" \
                "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
}
