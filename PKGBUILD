# SPDX-FileCopyrightText: Arch Linux contributors
# SPDX-License-Identifier: 0BSD

# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=fasttext-langid-models
pkgdesc="Pre-trained models for language identification for fasttext"
url="https://fasttext.cc/docs/en/language-identification.html"

pkgver=0.0.1
pkgrel=5

arch=("any")
license=("CC-BY-SA-3.0")

source=(
    "https://dl.fbaipublicfiles.com/fasttext/supervised-models/lid.176.bin"
    "https://dl.fbaipublicfiles.com/fasttext/supervised-models/lid.176.ftz"
    "LICENSE::https://creativecommons.org/licenses/by-sa/3.0/legalcode.txt"
)
b2sums=(
    "761f6eaae30314149d88b8bc278d9699e18b5b77b47b9e7197132f075f381aeef671a824611335e7241be3c26231c0e2da8a4420d61eca792480ba7c90f63f94"
    "2b447cfde42a44a651d6e430eb0d009516529f698d59073ca0109dcf93ffed78ff767b53bd176ee1bbc3b25b3a75c3af5e305e1fef29332a101b3545b3e2efcb"
    "10a22d502ddddbd91d368e0b2552bfce983738e07bcf77674b8670f2fe6ffb23b8996b2dcd4d82e36186be98e2ec30e661d5f02da8e73f001fbafbc66acedb2c"
)
noextract=(
    "lid.176.bin"
    "lid.176.ftz"
    "LICENSE"
)

optdepends=(
    "fasttext"
)

package() {
    install -Dm0644 "${srcdir}/lid.176.bin" "${pkgdir}/usr/share/fasttext/lid.176.bin"
    install -Dm0644 "${srcdir}/lid.176.ftz" "${pkgdir}/usr/share/fasttext/lid.176.ftz"
    install -Dm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
}
