# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Mr. Outis <mroutis@protonmail.com>

pkgname=dvc
pkgver=2.0.13
pkgrel=1
pkgdesc="Open-source version control system for data science projects"
arch=('any')
license=('Apache')
url="https://github.com/iterative/${pkgname}"
depends=('python' 'python-appdirs' 'python-colorama' 'python-configobj'
         'python-distro' 'python-flufl-lock' 'python-funcy' 'python-gitdb'
	 'python-gitpython' 'python-humanize' 'python-inflect'
	 'python-packaging' 'python-pathspec' 'python-ply' 'python-pyasn1'
         'python-yaml' 'python-requests' 'python-ruamel-yaml'
         'python-setuptools' 'python-shortuuid' 'python-tqdm'
         'python-treelib' 'python-voluptuous' 'python-zc.lockfile'
	 'python-nanotime' 'python-grandalf' 'python-ntfs' 'python-shtab'
	 'python-pygtrie'
)
optdepends=('python-google-cloud-storage: support for Google Cloud'
            'python-google-api-python-client: support for GDrive'
            'python-pydrive: support for GDrive'
            'python-boto3: support for AWS S3 remote'
            'python-paramiko: support for SSH remote'
            'python-azure-storage: support for Azure remote'
            'python-oss2: support for Aliyun Object Storage Service (OSS)'
            'python-pyarrow: support for HDFS remote'
	    )

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e74fee43f2048c0cca4250f46ed32edc6a6410208eda27b3ca1e94365e5377e7')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

