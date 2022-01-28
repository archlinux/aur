# Maintainer: MnJ (minionjim13 at gmail dot com)
# Contributor: Konstantin Gizdov <arch@kge.pw>

pkgname=(tensorflow_datasets)
pkgver='4.5.0'
pkgrel=1
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
makedepends=('python-pip'
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
source=("https://files.pythonhosted.org/packages/01/19/3652b3b32892750a19ae2f8b260d3d42e41db749248583c1b80050c2fd80/${pkgname}-${pkgver}-py3-none-any.whl")
sha256sums=('1c116a9c9c04ef4a14e0b3d61cd563f3fa0befcf6b64f5ffb220a9583e6bcc20')

package() {
  cd "${srcdir}"
  install -Dm644 "${pkgname}-${pkgver}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  pip install "${pkgname}-${pkgver}-py3-none-any.whl" --root="${pkgdir}" --no-deps --ignore-installed --no-warn-script-location
}
