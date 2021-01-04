# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=nfauthenticationkey
commit=4b1a2dca26b553e4b782b1799d4889058e0ed799
pkgver=1.1.1
_pkgtag=$pkgver
pkgrel=1
arch=('any')
pkgdesc="create a Netflix authentican Key, which can be used for the Neflix Kodi addon or somewhere else."
url="https://github.com/CastagnaIT/NFAuthenticationKey/tree/linux"
license=('GPL3')
makedepends=('sed')
depends=('chromium' 'python' 'python-pycryptodomex' 'python-websocket-client')
source=("NFAuthenticationKey-Linux-$pkgver.tar.gz::https://github.com/CastagnaIT/NFAuthenticationKey/archive/$commit.tar.gz")
sha512sums=('df8a81309ec365b5dfcd7bcc423578a7c541e48b043fc13eb3d9dfbc82a9263d86381e6bed7ce8448c8248a65a3e06334b95cae1ad23c0d2504fc4e4a1bbe13d')


prepare()
{
	sed -i '1i #!/usr/bin/python' "$srcdir/NFAuthenticationKey-$commit/NFAuthenticationKey.py"
}

package()
{
	install -Dm 755 "${srcdir}/NFAuthenticationKey-$commit"/NFAuthenticationKey.py "${pkgdir}/usr/bin/nfauthenticationkey"
}
