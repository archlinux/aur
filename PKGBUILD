# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=knitr
_cranver=1.33
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A General-Purpose Package for Dynamic Report Generation in R"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2 GPL3)
depends=('r>=3.2.3' 'r-evaluate>=0.10' r-highr r-markdown 'r-stringr>=0.6' 'r-yaml>=2.1.19' 'r-xfun>=0.21')
optdepends=(r-formatr r-testit r-digest r-rgl r-codetools r-rmarkdown r-htmlwidgets r-webshot r-tikzdevice r-tinytex r-reticulate r-juliacall r-magick r-png r-jpeg r-gifski r-xml2 r-httr r-dbi r-showtext r-tibble r-sass r-ragg r-styler 'pandoc: R Markdown v2 and reStructuredText support' 'rst2pdf: rst2pdf() support')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('2f83332b0a880de6eae522271bda7f862c97693fba45c23ab1f772028f6c0909')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
