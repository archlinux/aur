# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-deeppavlov
pkgver=0.11.0
pkgrel=1
pkgdesc='An open source library for deep learning end-to-end dialog systems and chatbots'
arch=('any')
url='https://deeppavlov.ai'
license=('Apache')
depends=('python-aio-pika'
         'cython'
         'python-fastapi'
         'python-h5py'
         'python-nltk'
         'python-numpy'
         'python-pandas'
         'python-pytz'
         'python-pydantic'
         'python-pymorphy2'
         'python-pymorphy2-dicts-ru'
         'python-pyopenssl'
         'python-requests'
         'python-ruamel-yaml'
         'python-scikit-learn'
         'python-scipy'
         'python-tqdm'
         'python-click'
         'python-sacremoses'
         'python-overrides'
         'python-pytelegrambotapi'
         'python-rusenttokenize'
         'uvicorn')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deepmipt/DeepPavlov/archive/${pkgver}.tar.gz")
sha256sums=('4f86fa24c4b185785d1f61410bd8ee43a9f4e48420c813e8c218292a61471b5e')

prepare() {
  cd "DeepPavlov-${pkgver}"
  sed -i 's|==|>=|' requirements.txt
}

package() {
  cd "DeepPavlov-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}