#Maintainer: Ian Ker-Seymer <i.kerseymer@gmail.com>

pkgname=aws-ecs-cli
pkgver=0.6.4
pkgrel=2
pkgdesc="The Amazon EC2 Container Service (Amazon ECS) command line interface (CLI) provides high-level commands to simplify creating, updating, and monitoring clusters and tasks from a local development environment."
depends=('docker')
makedepends=('curl')
arch=('x86_64')
options=(!strip)
source=(
  "https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-v${pkgver}"
)
url="https://docs.aws.amazon.com/AmazonECS"
license=("Apache")
md5sums=("$(curl -s https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-v${pkgver}.md5)")

package() {
  cd "$srcdir"
  chmod +x "ecs-cli-linux-amd64-v${pkgver}"
  install -Dm755 "ecs-cli-linux-amd64-v${pkgver}" "$pkgdir/usr/bin/ecs-cli"
}
