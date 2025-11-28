# Maintainer: Your Name <your.email@example.com>
pkgname=taskfile-to-tasks-python-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert Taskfile.yml to an editor tasks format, like VSCode and Zed tasks.json"
arch=('any')
url="https://github.com/H3mul/TaskfileToTasks"
license=('MIT')
depends=('python' 'python-pip')
makedepends=('git')
provides=('taskfile-to-tasks')
conflicts=('taskfile-to-tasks')
options=('!debug')
source=('git+https://github.com/H3mul/TaskfileToTasks.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/TaskfileToTasks"
  grep version pyproject.toml | head -n 1 | sed 's/version = "\(.*\)"/\1/'
}

build() {
  cd "${srcdir}/TaskfileToTasks"
  python setup.py build
}

package() {
  cd "${srcdir}/TaskfileToTasks"
  python setup.py install --root="${pkgdir}" --optimize=1
}
