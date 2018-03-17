# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Contributer: Sebastian Wilzbach <sebi at wilzbach dot me>

pkgname=biopieces
pkgver=2.0
pkgrel=1
pkgdesc='Bioinformatic framework of tools easily used and easily created'
arch=('any')
url='http://maasha.github.io/biopieces/'
license=('GPL2')
depends=(
  'perl'
  'ruby'
  'perl-svg'
  'perl-bit-vector'
  'perl-term-readkey'
  'perl-dbi'
  'perl-xml-parser'
  'perl-carp-clan' 
  'perl-class-inspector'
  'perl-html-parser'
  'perl-soap-lite'
  'perl-uri'
  'perl-inline'
  'perl-parse-recdescent'
  'perl-dbd-mysql'
  'ruby-gnuplot'
  'perl-json-xs'
  'python2'
  'ruby-terminal-table'
)
optdepends=(
  'blast: legacy blast'
  'gnuplot'
  'blat'
  'bwa'
  'bowtie'
  'bowtie2'
  'hmmer'
  'mummer'
  'muscle'
  'velvet'
)
source=("${pkgname}"-"${pkgver}".tar.gz::https://github.com/maasha/"${pkgname}"/archive/"${pkgver}".tar.gz)
sha256sums=('484877c4a844ed1e6c70594248c44b9f19a6e7a1fd08456e28f2cc83425151e8')

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"

  for script in bin/*; do
    if [[ "${script}" =~ README ]]; then continue; fi
    install -Dm755 "${script}" "${pkgdir}"/opt/"${pkgname}"/"${pkgname}"-"$( basename "${script}" )"
  done
}
