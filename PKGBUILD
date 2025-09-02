# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-misaki
pkgname=(python-misaki{,-{en,ja,ko,zh,vi,he}})
_name=misaki
pkgver=0.9.4
pkgrel=2
epoch=
pkgdesc="G2P engine for TTS"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
depends=(
    python
    python-regex
    # AUR
    python-addict
)
makedepends=(
    python-hatchling
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('3960fa3e6de179a90ee8e628446a4a4f6b8c730b6e3410999cf396189f4d9c40')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package_python-misaki() {
    provides=(${pkgname})
    conflicts=(${pkgname})

    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-misaki-en() {
    pkgdesc+=" - en"
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        python-misaki
        python-pytorch
        # AUR
        python-espeakng-loader
        python-num2words
        python-spacy
        python-spacy-curated-transformers
        python-transformers
    )
}

package_python-misaki-ja() {
    pkgdesc+=" - ja"
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        python-jaconv
        python-misaki
        # AUR
        python-fugashi
        python-mojimoji
        python-unidic
        python-pyopenjtalk
    )
}

package_python-misaki-ko() {
    pkgdesc+=" - ko"
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        python-nltk
        python-misaki
        # AUR
        python-jamo
    )
}

package_python-misaki-zh() {
    pkgdesc+=" - zh"
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        python-jieba
        python-ordered-set
        python-misaki
        # AUR
        python-cn2an
        python-pypinyin
        python-pypinyin-dict
    )
}

package_python-misaki-vi() {
    pkgdesc+=" - vi"
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        python-misaki
        # AUR
        python-num2words
        python-spacy
        python-spacy-curated-transformers
        python-underthesea
    )
}

package_python-misaki-he() {
    pkgdesc+=" - he"
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        python-misaki
        # AUR
        python-mishkal-hebrew
    )
}
