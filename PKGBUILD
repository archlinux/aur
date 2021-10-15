# Maintainer: Michael Hauser-Raspe
pkgname=astro-cli
pkgver=v0.26.0
pkgrel=1
pkgdesc="The Astronomer CLI can be used to build Airflow DAGs locally and run them via docker-compose, as well as to deploy those DAGs to Astronomer-managed Airflow clusters and interact with the Astronomer API in general."
arch=('x86_64')
url="https://github.com/astronomer/astro-cli"
license=('Apache')
makedepends=('tar')
provides=('astro')
source=("https://github.com/astronomer/$pkgname/releases/download/$pkgver/astro_${pkgver/v/}_linux_amd64.tar.gz")
sha256sums=('e6553794e3807e3ef7e6bfed8775a5c2809037ed103e7e50f96635cb71bc259b')

package() {
  cd "$srcdir"
  tar xvfz astro_${pkgver/v/}_linux_amd64.tar.gz
  mkdir -p $pkgdir/usr/local/bin/
  mv astro $pkgdir/usr/local/bin/
}
