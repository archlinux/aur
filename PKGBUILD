# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Biginoz <biginoz _at_ free point fr>
# Contributor: andy123 < ajs AT online DOT de >
# Contributor: Deather <deather.jeuxlinux@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=unknown-horizons
pkgver=2019.1
pkgrel=7
pkgdesc="2D realtime strategy simulation with an emphasis on economy and city building."
arch=('any')
url="https://unknown-horizons.org/"
license=('GPL' 'CCPL')
changelog=.CHANGELOG
depends=('fife' 'python' 'python-pillow' 'python-yaml')
makedepends=('intltool' 'python-setuptools' 'python-distro')
conflicts=('unknown-horizons-git')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname-[PATCH]-replace-deprecated-to-distro-package-(#2910).patch::https://github.com/$pkgname/$pkgname/commit/2fdb225f62f66bf474e19d9b1bcfbaf691672c43.patch"
        "$pkgname-[PATCH]-SyntaxWarning:-\"is\"-with-a-literal.-(#2924).patch::https://github.com/$pkgname/$pkgname/commit/05267e0d7f1223ddd0517f4f02c4d8444668f559.patch"
        "$pkgname-[PATCH]-Update-travis-to-python3.7,-fifechan-1.5-(#2893).patch::https://github.com/$pkgname/$pkgname/commit/68c306c0b8e7ac515418b4e138d234555b1ee3e9.patch"
        "$pkgname-[PATCH]-Update-requirements.txt.patch::https://github.com/$pkgname/$pkgname/commit/82b3109f0bc2ce3444d24d0bb25766a9339917ec.patch"
        "$pkgname-[PATCH]-Update-pillow-for-security-reasons.patch::https://github.com/$pkgname/$pkgname/commit/33488fa3bcdf6a11a90740b5d9d47565a7d43a73.patch"
        "$pkgname-[PATCH]-Update-pillow-because-of-CVE-**-Bugs.patch::https://github.com/$pkgname/$pkgname/commit/d2dc7c017455a1308f5813f5195aa288ee52d170.patch"
        "$pkgname-[PATCH]-fixs-for-Phyton-3.9-(#2955).patch::https://github.com/$pkgname/$pkgname/commit/7f6f613826aef9810999c1599c8354e8a78fbdb4.patch"
        "$pkgname-[PATCH]-Python-Pillow-10-compatibility-(#2962).patch::https://github.com/$pkgname/$pkgname/commit/d543cd4d57afcf8dc24b2bac4b124b4a2a8cc658.patch"
        "$pkgname-[PATCH]-remove-dead-Python2-code-(#2963).patch::https://github.com/$pkgname/$pkgname/commit/e50348da5ed3044957b56525d8e9816b8815d3f1.patch")
sha512sums=('87ae37442ee0b80130c7a75c7eeb7c0ef6c50f3e6b2616db32e6381ace5068729ab7086edefc00eefd3b89e85f9a05fb6c4d05f2a2adc46fa928e5c2a29b72db'
            'd9d9fece7f7f18590027d1094ab7b86241ea17870414f5e56205e269d2084f0ee7a31f050412135a678cbc15e57e5ec618afb1b89c13b7a3fe4f858b69e01dde'
            '0c131311eab19d4f5a45726187f4e87dd1a1af25e75559078df1836f2c13d013bfdfd32a8c57cfe1e571a4a2109730865dcd32f19ed618892e44a3377c6ade1b'
            'd7b743b1ca7541d06db5d71f87c6d07381b4d1326ba0dc6476b743a6a76f7fdcb8c24a962fb8c9664237724dc7b90bace2c7f1cd9dbc48493e61f050ce717598'
            '0bf73c5cc9761d620e2b622ac181d2431600e28a38e797bd119766ffb15f4a6e52c867bc1b9a3a2db394ea80a1168e0c467647dc313a965fda12ccd3fbb6bc43'
            'fdefa84e436be085e4d0ca4f1f23819a26a01db6308b3d0d3d81a178fc1c59920d03438468fec75123aaa48b5b6b3eac14e780fa90403b6d66479c82c4a9742b'
            '7f30d9272291ff0f7e3a036809387bdae401de1d99edfedf631226927710bfecac42c141405c4ae519bc69a79fcf8f98be6507b7d57c980772bc1edc62958a46'
            'fe47ea81f353fa26987f609c05a77729369b234a12903f9f977614eaa7dabeb720fa369901e8898ce094e36ecb350773aca48ba3addc6617a34c913cb3b895b0'
            '2503710df7dcec1ba1e399cbe724f1fbe650515961f0bb940957ce2358b99746876b0818f4c4052fcd81b34c9c964b0d3f9319287388b531495af41a5fade573'
            '9407c1b5c8edf74c5acc3cb2bf315486a73c2a6073d06d565082e868dd5bed1947a597c4a2ed79aff8f04d93091c37172f482bb0d212d571ff072691b002a259')

prepare() {
    cd "$pkgname-$pkgver" || exit 1
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-replace-deprecated-to-distro-package-(#2910).patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-SyntaxWarning:-\"is\"-with-a-literal.-(#2924).patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-Update-travis-to-python3.7,-fifechan-1.5-(#2893).patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-Update-requirements.txt.patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-Update-pillow-for-security-reasons.patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-Update-pillow-because-of-CVE-**-Bugs.patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-fixs-for-Phyton-3.9-(#2955).patch"
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-Python-Pillow-10-compatibility-(#2962).patch"

    # force success here because some missing docker files fail the patching:
    patch --forward --strip=1 \
        --input="$srcdir/$pkgname-[PATCH]-remove-dead-Python2-code-(#2963).patch" || true
}

build() {
    cd "$pkgname-$pkgver" || exit 1
    # unknown-horizons build system misses a few files if the build step is seperated from the install step
    # -> Do not build here for now
    # UH_USER_DIR="UH_USER_DIR" python setup.py build
    UH_USER_DIR="UH_USER_DIR" python horizons/engine/generate_atlases.py 2048
}

package() {
    cd "$pkgname-$pkgver" || exit 1
    UH_USER_DIR="UH_USER_DIR" python setup.py install --root="$pkgdir/" --optimize=1 #--skip-build
}
