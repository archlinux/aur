# Maintainer: Torsten Henschel <to at h6l dot de>
# Contributor: Karol Babioch <karol at babioch dot de>

pkgname=getssl
pkgver=2.52
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
sha512sums=('62168710ac048b69ab57eded1c046172714c3adc8ca43bc7b02bf266d6c057446aae58e9f1de3cfd473936cadf91e797bca3da9e6e3753fb3aec806ebd5309e4')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
