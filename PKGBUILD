# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=nfauthenticationkey
_commit=eef806798f0b211dd87cdb1f949956801a812eb7
pkgver=1.1.3
pkgrel=1
arch=('any')
pkgdesc="create a Netflix authentican Key, which can be used for the Neflix Kodi addon or somewhere else."
url="https://github.com/CastagnaIT/NFAuthenticationKey/tree/linux"
license=('GPL3')
makedepends=('sed')
depends=('nfauthenticationkey-browser' 'python' 'python-pycryptodomex' 'python-websocket-client')
source=("NFAuthenticationKey-Linux-$pkgver.tar.gz::https://github.com/CastagnaIT/NFAuthenticationKey/archive/$_commit.tar.gz")
sha512sums=('639203cf05bb2c71b7ad7aa21e129b01b89ac91578aa59ad2aa31a8601b07ceb82854201207b2cc501e4a0c16ee188b61f2e1b507e63b72ca55f75ccd991730d')


prepare()
{
	sed -i '1i #!/usr/bin/python' "$srcdir/NFAuthenticationKey-$_commit/NFAuthenticationKey.py"
}

package()
{
	install -Dm 755 "${srcdir}/NFAuthenticationKey-$_commit/NFAuthenticationKey.py" "${pkgdir}/usr/bin/nfauthenticationkey"
}
