# Maintainer: François Pelletier <francois@jevalide.ca> -> https://git.jevalide.ca/gitlab

pkgname=nbia-data-retriever
pkgver=4.4
pkgrel=2
pkgdesc="NBIA Data Retriever is an app that facilitates downloading images from the National Biomedical Imaging Archive (NBIA) and The Cancer Imaging Archive (TCIA)"
url="https://wiki.cancerimagingarchive.net/display/NBIA/Cancer+Imaging+Archive+User%27s+Guide#CancerImagingArchiveUser%27sGuide-DownloadingStudyData"
arch=(x86_64)
source=("https://cbiit-download.nci.nih.gov/nbia/releases/ForTCIA/NBIADataRetriever_4.4/nbia-data-retriever-4.4.deb")
license=('BSD-3-Clause')
depends=('java-runtime>7')
sha256sums=('266d6a9efdd795ec236a7bdd84cb69bb6fdae41c1218260828f3efe34b31fc2d')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/"
}
