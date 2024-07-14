# Maintainer: Torsten Henschel <to at h6l dot de>
# Contributor: Karol Babioch <karol at babioch dot de>

pkgname=getssl
pkgver=2.49
pkgrel=1
pkgdesc="Obtain SSL certificates from the letsencrypt.org ACME server. Suitable for automating the process on remote servers."
arch=('any')
url="https://github.com/srvrco/getssl"
license=('GPL-3.0-only')
depends=('bash' 'openssl' 'curl' 'bind-tools')
optdepends=('python: optional update scripts'
            'python-dnspython: optional update scripts'
            'python-boto3: optional update scripts')
source=("$pkgname-$pkgver.tar.gz::https://github.com/srvrco/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('4283799134ec09b2c70901c3340f87e25dc88e8c8a242c7bcb00c26b435e807567fba4e160559dce5021831253632b5eb06bec5c8d2cd3a3642fe887a7a26945')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
