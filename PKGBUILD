# Maintainer: Michael Hauser-Raspe
pkgname=astro-cli
pkgver=v1.0.0
pkgrel=1
pkgdesc="The Astronomer CLI can be used to build Airflow DAGs locally and run them via docker-compose, as well as to deploy those DAGs to Astronomer-managed Airflow clusters and interact with the Astronomer API in general."
arch=('x86_64')
url="https://github.com/astronomer/astro-cli"
license=('Apache')
makedepends=('tar')
provides=('astro')
source=("https://github.com/astronomer/$pkgname/releases/download/$pkgver/astro_${pkgver/v/}_linux_amd64.tar.gz")
sha256sums=('7dbd233778ee651cc8de28f277a1c4599ad3e256429aa25454cf49eb06cf30fa')

package() {
  cd "$srcdir"
  tar xvfz astro_${pkgver/v/}_linux_amd64.tar.gz
  mkdir -p $pkgdir/usr/local/bin/
  mv astro $pkgdir/usr/local/bin/
}
