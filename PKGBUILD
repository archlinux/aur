# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=android-constraint-layout
pkgver=1.0.2
pkgrel=1
pkgdesc='ConstraintLayout for Android (includes solver)'
arch=('any')
url="https://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/com.android.support.constraint-constraint-layout-${pkgver}.zip"
        "http://dl-ssl.google.com/android/repository/com.android.support.constraint-constraint-layout-solver-${pkgver}.zip")
sha1sums=('3d9688a50fe0ed7348275f85d1b02278f616d8a4'
          '96d7ff669f0e808e9833b2c2e320702826ccc8be')

package() {
  _dir_layout="${pkgdir}/opt/android-sdk/extras/android/m2repository/com/android/support/constraint/constraint-layout"
  _dir_solver="${_dir_layout}-solver"

  mkdir -p "${_dir_layout}/" "${_dir_solver}/"

  cp -dpr --no-preserve=ownership "${srcdir}/constraintlayout" "${_dir_layout}/${pkgver}"
  cp -dpr --no-preserve=ownership "${srcdir}/solver" "${_dir_solver}/${pkgver}"

  chmod -R ugo+rX "${pkgdir}/opt"
}
