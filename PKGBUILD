# Maintainer: MnJ (minionjim13 at gmail dot com)
# Contributor: Konstantin Gizdov <arch@kge.pw>

pkgname=(tensorflow_datasets)
_name='tensorflow-datasets'
pkgver='4.4.0'
pkgrel=2
url="https://github.com/tensorflow/datasets"
pkgdesc="A collection of datasets ready to use with TensorFlow"
depends=('absl-py'
         'python-attrs'
         'python-dill'
         'python-future'
         'python-numpy'
         'python-promise'
         'python-protobuf'
         'python-requests'
         'python-six'
         'tensorflow_metadata'
         'python-termcolor'
         'python-tqdm')
makedepends=('python-setuptools'
             'python-wheel')
optdepends=('python-beautifulsoup4: wsc273'
            'python-pycocotools: youtube_vis'
            'python-h5py: robonet'
            'python-imagecodecs: eurosat'
            'python-langdetect: c4'
            'python-librosa: nsynth'
            'python-lxml: wsc273'
            'python-matplotlib: cats_vs_dogs'
            'python-mwparserfromhell: wikipedia'
            'python-networkx: ogbg_molpcba'
            'python-nltk: c4'
            'python-opencv: imagenet2012_corrupted'
            'python-pandas: ogbg_molpcba, pet_finder'
            'python-pillow: colorectal_histology, wider_face'
            'python-pydub: common_voice, groove, gtzan, librispeech'
            'python-scikit-image: eurosat, imagenet2012_corrupted'
            'python-scikit-learn: nsynth'
            'python-scipy: aflw2k3d, duke_ultrasound, imagenet2012_corrupted, svhn, the300w_lp'
            'python-tifffile: eurosat'
            'python-tldextract: c4')
license=('Apache')
arch=('any')
source=("https://files.pythonhosted.org/packages/04/9c/002251b49db860edeb7e203ad12b1369234f9f619bacb0931c60eacbf3ee/${_name}-${pkgver}.tar.gz")
sha256sums=('3e95a61dec1fdb7b05dabc0dbed1b531e13d6c6fd362411423d0a775e5e9b960')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py sdist
  python setup.py bdist_wheel
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="${pkgdir}" -O2 --skip-build
}
