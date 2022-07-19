# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgbase='python-parquet-tools'
pkgname=('python-parquet-tools')
_name='parquet_tools'
pkgver='0.2.11'
pkgrel=2
pkgdesc="Easy install parquet-tools"
url="https://github.com/ktrueda/parquet-tools"
depends=(
    'python>=3.8'
    'python-halo>=0.0.29' 'python-halo<0.1.0'
    'python-pyarrow'
    'python-pandas>=1' 'python-pandas<=2'
    'python-tabulate>=0.8.7' 'python-tabulate<0.9.0'
    'python-boto3>=1.13' 'python-boto3<2.0'
    'python-thrift>=0.13.0' 'python-thrift<1'
    'python-boto3>=1.13' 'python-boto3<=2'
    'python-colorama>=0.4.3' 'python-colorama<0.5.0'
)

makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('14a68c9792bd0c6f794824c263f64a19a85a0c26ce5a590e062b4a91509be945')

package() {
    python -m installer --destdir="$pkgdir" ${_name}-${pkgver}-py3-none-any.whl
    install -Dm0644 $_name-$pkgver.dist-info/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
