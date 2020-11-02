# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=nfauthenticationkey
pkgver=1.0.3
_pkgtag=$pkgver
pkgrel=1
arch=('x86_64')
pkgdesc="create a Netflix authentican Key, which can be used for the Neflix Kodi addon or somewhere else."
url="https://github.com/CastagnaIT/plugin.video.netflix/wiki/Login-with-Authentication-key"
license=('GPL3')
makedepends=('sed')
depends=('chromium' 'python' 'python-pycryptodomex' 'python-websocket-client')
source=("nfauthenticationkey-$_pkgtag::https://uc48a7e4c6d51315614c3394c1a7.dl.dropboxusercontent.com/cd/0/get/BCc72VGHTKW5FoNtL_X0WUUq1LDRdfkRNBbTvpTT2wmujPPWnr2aTAmxcozRdlVbIoZ8OTZ6wj6tqIeWethuegeKycBGiAzFkUWUFUGwfimR18RKlH_nsDcvYVz38BOcJNU/file?_download_id=84288066276119277774198933696335530124090209346608197039563885744&")
sha512sums=('dbf74fc7e282275d7c173713143f97d731e45fb314e0f8078417a3f5716be433ad181c6a99c2c1129db6bf859a690daacbdde3fe696ba1a769bd4296589ddfaf')


build()
{
	cd "$srcdir/NFAuthenticationKey"
	sed -i '1i #!/usr/bin/python' NFAuthenticationKey.py
}

package()
{
	install -Dm 755 "${srcdir}/NFAuthenticationKey/NFAuthenticationKey.py" "${pkgdir}/usr/bin/nfauthenticationkey"
}
