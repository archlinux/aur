pkgname=emercoin-bin
_pkgname=emercoin
_githuborg=emercoin
pkgver='0.8.5'
pkgrel='3'
pkgdesc="Emercoin is a digital currency and blockchain service platform."
arch=('x86_64')
provides=('emercoin')
conflicts=('emercoin')
url="http://emercoin.com/"
license=('GPL3')
install='emercoin.install'
_archive="emercoin-${pkgver}-x86_64-linux-gnu"
source_x86_64=("https://github.com/emercoin/emercoin/releases/download/v${pkgver}emc/${_archive}.tar.xz"
"emercoin.install"
"emercoind.service"
"emc48.png"
"com.emercoin.Emercoin.desktop")
sha256sums_x86_64=('c4b0f4551956a14e33ebe7f9d88479db3a0b92fd20649b8b4a46f7c69ea68db0'
                   '675f3c25f9c2d353519960ea6b9e0d283f074e057750f0b870dac888e577277b'
                   '9e0832225a161a0c2694890e4d1791eedf943f96556db153e3cd5e40906ef5ed'
                   '99d13ec06eb0d09662632e9eb6309ee38e03162f09513b23747f189602552132'
                   'dfa7a4c2f717bbc29ba4273d65f80e0ee5853379e0632e458ae12df1ace72fcf')

package() {
  _pkgdir="${pkgdir}"
  _systemddir="usr/lib/systemd/system"
  _package
}

_package() {
    install -Dm644 ${srcdir}/emercoind.service ${_pkgdir}/usr/lib/systemd/system/emercoind.service
    install -Dm644 "${srcdir}"/com.emercoin.Emercoin.desktop ${_pkgdir}/usr/share/applications/com.emercoin.Emercoin.desktop
    install -Dm644 "${srcdir}"/emc48.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/emercoin.png
		install -Dm755 ${_archive}/emercoind ${_pkgdir}/usr/bin/emercoind
		install -Dm755 ${_archive}/emercoin-qt ${_pkgdir}/usr/bin/emercoin-qt
		install -Dm755 ${_archive}/emercoin-cli ${_pkgdir}/usr/bin/emercoin-cli
    chmod +x ${_pkgdir}/usr/bin/emercoind ${_pkgdir}/usr/bin/emercoin-qt ${_pkgdir}/usr/bin/emercoin-cli
}
