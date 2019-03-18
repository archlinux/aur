# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=ludwig-example
pkgver=1.0
pkgrel=1
pkgdesc='Example for training deep learning models with Ludwig'
arch=(any)
url='http://archive.ics.uci.edu/ml/datasets/Reuters-21578+Text+Categorization+Collection'
license=(custom)
depends=(python-ludwig)
source=('http://boston.lti.cs.cmu.edu/classes/95-865-K/HW/HW2/reuters-allcats-6.zip'
        model_definition.yaml
        ludwig-example
        LICENSE)
sha256sums=('304ae223f9ca35f7ce9066c9d31558c06ed5c72cd91faa885f82b928b2aa6f34'
            '27f15371a678d474594b4b9b241c7a6744eed8b3618a91e1934aeed03d7da9a6'
            'bebaec0bc5d12a63dbfe49f738260297b0332e1a799166dcb049ba01d7dcc923'
            'c20059f271d10ff8bada6fda7e3af47cb5a0954b60075654e5f7a97f25b52186')

package() {
  install -Dm644 reuters-allcats.csv "$pkgdir/usr/share/$pkgname/reuters-allcats.csv"
  install -Dm755 model_definition.yaml "$pkgdir/usr/share/$pkgname/model_definition.yaml"
  chmod a+w "$pkgdir/usr/share/$pkgname"

  install -Dm755 ludwig-example "$pkgdir/usr/bin/ludwig-example"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
