# Maintainer: Kenny MacDermid <kenny.macdermid@gmail.com>
pkgname=aws-adfs
pkgver=2.8.2
pkgrel=1
pkgdesc="Command line tool to ease aws cli authentication against ADFS "
arch=('any')
url="https://github.com/venth/aws-adfs"
license=('MIT')
depends=('python'
         'python-boto3'
         'python-botocore'
         'python-click'
         'python-fido2'
         'python-lxml'
         'python-requests'
         'python-requests-kerberos')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/venth/aws-adfs/releases/download/v$pkgver/aws_adfs-$pkgver.tar.gz")
sha512sums=('fb9be80c9d2da53cd54420dd91ca87edeff248d1bf23e50b151e808a63840744a375f8af432b7527b935d74fae3adfd00a342a83d0eb6d7e4df759fc0a2666d9')

package() {
    cd "$srcdir/${pkgname/-/_}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
