# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=encrypt-and-sync
_name=eas
_py=py3
pkgver=0.7.2
pkgrel=1
pkgdesc="A file synchronization utility with client-side encryption support"
arch=("any")
url="https://encryptandsync.com"
license=("GPL3")
depends=("python>=3.5.0" "python-setuptools" "python-portalocker" "python-pycryptodome" "python-s3m>=1.1.0")
makedepends=("python" "python-pip")
optdepends=("python-pysftp: SFTP support"
            "python-paramiko: SFTP support"
            "python-dropbox: Dropbox support"  
            "python-yadisk: Yandex.Disk support"
            "python-requests: Dropbox, Yandex.Disk support")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=("c034a571f8e12dd571b53f1a65deddd38e604d855646178b1883873c2f75bc5b")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.tar.gz
}
