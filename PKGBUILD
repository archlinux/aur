# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=nfauthenticationkey
pkgver=1.0.2
_pkgtag=$pkgver
pkgrel=1
arch=('x86_64')
pkgdesc="create a Netflix authentican Key, which can be used for the Neflix Kodi addon or somewhere else."
url="https://github.com/CastagnaIT/plugin.video.netflix/wiki/Login-with-Authentication-key"
license=('GPL3')
makedepends=('sed')
depends=('chromium' 'python' 'python-pycryptodomex' 'python-websocket-client')
source=("nfauthenticationkey-$_pkgtag::https://uc79711dcc3eb207791cb905dcd8.dl.dropboxusercontent.com/cd/0/get/BB6uRiZkmb-EIi4kFMna58ZhGRXcMm00uUv2RUwrIBhMlSNorATU-MKPONKgJhgqVeGGzCOButf8nHtMoN2ceI-enraiJ8oIt6CnIzIcLSNIGpRW_MwMa_B_CajelgAqKk8/file?_download_id=1071622147333345433772012811057006427080772897257432944089818271399689&")
sha512sums=('9f7e68451cfaf12599369d20a7b6a9be199b2bb45f0b079aaae7a3b56db7056d0573d4aba42e12e2e195fc3e09dd5f6ae330b8f47de5dfe15fa0f02e3c8f24b1')


build()
{
	cd "$srcdir/NFAuthenticationKey"
	sed -i '1i #!/usr/bin/python' NFAuthenticationKey.py
}

package()
{
	install -Dm 755 "${srcdir}/NFAuthenticationKey/NFAuthenticationKey.py" "${pkgdir}/usr/bin/nfauthenticationkey"
}
