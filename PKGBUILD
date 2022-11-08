# Maintainer: Kenny MacDermid <kenny.macdermid@gmail.com>
pkgname=aws-adfs
pkgver=2.6.3
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
sha512sums=('fdf844ff988a47959e51610fc80d295f3db6dffdc75d7a61878a60af4aa868c83f354b5dd758bdf4568d13298451a26a1a517f3bc293e1d6633f6e277a465f6c')

package() {
    cd "$srcdir/${pkgname/-/_}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
